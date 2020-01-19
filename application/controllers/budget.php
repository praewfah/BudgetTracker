<?php
/**
 * Budget Tracker 
 * the application to keeps track of a household’s budget. 
 * 
 * @author	Aumaporn Tangmanosodsikul
 * @email	preawfah@hotmail.com
 */

defined('BASEPATH') OR exit('No direct script access allowed');

class Budget extends CI_Controller 
{
    public function __construct() 
    {
        parent::__construct();
        $this->smarty->assign("base_url", $this->config->item('base_url'));
        
        $this->_set_session_message();
    }
    
    public function budget() 
    {
        $data = array();
        $data['page'] = "budget";   
        $data['title'] = "Budget Tracker";   
        $data['month'] = date("F");   
        $data['year'] = date("Y");   
        
        $data['list_month'] = array(
            "January" => "01",
            "February" => "02",
            "March" => "03",
            "April" => "04",
            "May" => "05",
            "June" => "06",
            "July" => "07",
            "August" => "08",
            "September" => "09",
            "October" => "10",
            "November" => "11",
            "December" => "12"
        );

        $this->smarty->view('budget.tpl', $data);
    }
    
    public function transection() 
    {
        $data = array();
        $data['page'] = "transection";   
        $data['title'] = "Budget Tracker - Cash Flow";  
        
        $timestamp    = strtotime(date("Y-m-d"));
        $data['date_from'] = date('Y-m-01', $timestamp);   
        $data['date_to'] = date('Y-m-d');  

        $this->smarty->view('transection.tpl', $data);
    }
    
    public function load_budget_transection($date_from, $date_to) 
    {
        $data = array();
        $data['data'] = $this->budget_model->get_transection($date_from, $date_to) ;
        
        echo json_encode($data); 
    }
    
    public function load_budget_income($month, $year) 
    {
        $data = array();
        $data['data'] = $this->budget_model->get_budget('Income', $month, $year);
        
        $total_amount = 0;
        $total_actual = 0;
        $total_difference = 0;
        
        // totals
        foreach ($data['data'] as $budget) {
            if (isset($budget->budget_amount) ) {
                $total_amount += (float)$budget->budget_amount;
            }
            if (isset($budget->actual) ) {
                $total_actual += (float)$budget->actual;
            }
            if (isset($budget->difference) ) {
                $total_difference += (float)$budget->difference;
            }
        }
        
        $totals = array(
            'budget_category' => 'Totals',
            'budget_amount' => $total_amount,
            'actual' => $total_actual,
            'difference' => $total_difference
        );
        
        array_push($data['data'], $totals);
        $data['total_income'] = $total_actual;
        
        echo json_encode($data); 
    }
    
    public function load_budget_expense($month, $year) 
    {
        $data = array();
        $data['data'] = $this->budget_model->get_budget('Expense', $month, $year);
        
        $total_amount = 0;
        $total_actual = 0;
        $total_difference = 0;
        
        // totals
        foreach ($data['data'] as $budget) {
            if (isset($budget->budget_amount) ) {
                $total_amount += (float)$budget->budget_amount;
            }
            if (isset($budget->actual) ) {
                $total_actual += (float)$budget->actual;
            }
            if (isset($budget->difference) ) {
                $total_difference += (float)$budget->difference;
            }
        }
        
        $totals = array(
            'budget_category' => 'Totals',
            'budget_amount' => $total_amount,
            'actual' => $total_actual,
            'difference' => $total_difference
        );
        
        array_push($data['data'], $totals);
        $data['total_expense'] = $total_actual;
        
        echo json_encode($data); 
    }

    public function add_budget() 
    {
        $data = array();
        $data['page'] = "add_budget"; 
        $data['title'] = "Budget Tracker - Add Budget";   
        
        $data['month'] = date("F");   
        $data['year'] = date("Y");  
        $data['list_month'] = array(
            "January" => "01",
            "February" => "02",
            "March" => "03",
            "April" => "04",
            "May" => "05",
            "June" => "06",
            "July" => "07",
            "August" => "08",
            "September" => "09",
            "October" => "10",
            "November" => "11",
            "December" => "12"
        );

        $this->smarty->view('add_budget.tpl', $data);
    }
    
    public function add_transection() 
    {
        $data = array();
        $data['page'] = "add_transection"; 
        $data['title'] = "Budget Tracker - Add Transection";   
        $data['today'] = date('Y-m-d');   
        
        $this->smarty->view('add_transection.tpl', $data);
    }
    
    public function save_budget() 
    {
        if ($this->input->post()) {
            $values = $this->input->post();

            if (!$this->budget_model->save('budgets', $values)) {
                $this->session->set_userdata('error', 'save fail');
            } else {
                $this->session->set_userdata('message', 'save successful');
            }
            
            redirect('/budget/add_budget');
        }
    }
    
    public function save_transection() 
    {
        if ($this->input->post()) {
            $values = $this->input->post();

            $month = date("m", strtotime($values['transection_date']));   
            $year = date("Y", strtotime($values['transection_date']));   
        
            //check the budget
            $budget = $this->budget_model->get_budget($values['budget_type'], $month, $year, $values['budget_category']) ;
            
            if (empty($budget) || !count($budget)) {
                // save budget category as 0
                $budgets = array();
                $budgets["budget_month"] = $month;
                $budgets["budget_year"] = $year;
                $budgets["budget_type"] = $values["budget_type"];
                $budgets["budget_category"] = $values['budget_category'];
                $budgets["budget_amount"] = 0;
                
                $this->budget_model->save('budgets', $budgets);
            }
            
            if (!$this->budget_model->save('transections', $values)) {
                $this->session->set_userdata('error', 'save fail');
            } else {
                $this->session->set_userdata('message', 'save successful');
            }
            
            redirect('/budget/add_transection');
        }
    }
    
    private function _set_session_message()
    {
        if ($this->session->userdata('error')) {
            $this->smarty->assign("error", $this->session->userdata('error'));
            $this->session->unset_userdata('error');
        }
        if ($this->session->userdata('message')) {
            $this->smarty->assign("message", $this->session->userdata('message'));
            $this->session->unset_userdata('message');
        }
    }
}
