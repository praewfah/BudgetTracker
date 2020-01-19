<?php
/**
 * Budget Tracker 
 * the application to keeps track of a household’s budget. 
 * 
 * @author	Aumaporn Tangmanosodsikul
 * @email	preawfah@hotmail.com
 */

class budget_model extends CI_Model 
{
    public function __construct() 
    {
        parent::__construct();
    }
    
    public function get_budget($type='Income', $month=null, $year=null, $category=null) 
    {
        $data = array();
        if (!isset($month))
            $month = date('m');
        
        if (!isset($year))
            $year = date('Y');
        
        $where = array();
        $where['budget_month'] = $month;
        $where['budget_year'] = $year;
        $where['budget_type'] = $type;
        
        if(isset($category))
            $where['budget_category'] = $category;
        
        $this->db->select(array('budget_year','budget_month','budget_type', 'budget_category'));
        $this->db->select_sum('budget_amount', 'budget_amount');
        $this->db->where($where);
        $this->db->group_by('budget_type, budget_category');
        $this->db->order_by('budget_category');
        $query = $this->db->from('budgets');
        $get = $query->get();
        $rows = $get->result();
        
        foreach ($rows as $key => $row) {
            $data[$key] = $row;
            
            // find budget actual
            $where = array();
            $where['budget_type'] = $row->budget_type;
            $where['budget_category'] = $row->budget_category;
            
            $this->db->select_sum('actual', 'actual');
            $this->db->where($where);
            $this->db->like('transection_date', "$row->budget_year-$row->budget_month");
            $this->db->group_by('budget_type, budget_category');
            
            $query = $this->db->from('transections');
            
            $get_transections = $query->get();
            $rows_transections = $get_transections->result();
            
            if (count($rows_transections)) {
                foreach ($rows_transections as $transections) {
                    if ($type == "Income") {
                        $diff = ((float)$row->budget_amount - (float)$transections->actual)*-1;
                    } else {
                        $diff = ((float)$row->budget_amount - (float)$transections->actual);
                    }
                    $data[$key]->actual = (float)$transections->actual;
                    $data[$key]->difference = $diff;
                }
            } else {
                $data[$key]->actual = 0;
                $data[$key]->difference = 0;
            }
        }
        
        return $data;
    }
    
    public function get_transection($from, $to) 
    {
        $data = array();
        
        $this->db->where('transection_date BETWEEN "'. date('Y-m-d', strtotime($from)). 
                '" AND "'. date('Y-m-d', strtotime($to)).'"');
        
        $this->db->order_by('transection_date');
        $query = $this->db->from('transections');
        $get = $query->get();
        $rows = $get->result();
        
        foreach ($rows as $key => $row) {
            $data[$key] = $row;
            $data[$key]->transection_date = date("Y-m-d", strtotime($row->transection_date));
        }
        
        return $data;
    }
    
    public function save($table, $data) 
    {
        $filte_data = _filter_data($table, $data);
        return $this->db->insert($table, $filte_data);
    }
}
