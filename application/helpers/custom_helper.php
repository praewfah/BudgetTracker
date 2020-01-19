<?php

if (!function_exists('_filter_data')) :
    function _filter_data($table, $data)
    {
        $ci =& get_instance();
        $filtered_data = array();
        $columns =  $ci->db->list_fields($table);

        if (is_array($data)) {
            foreach ($columns as $column) {
                if ((isset($data[$column]) || array_key_exists($column,$data))) {
                    $filtered_data[$column] = trim($data[$column]);
                }
            }
        }

        return $filtered_data;
    }
endif;
