<?php

// redirect  
if (!function_exists('helper_redirect')) :
    function helper_redirect($path, $redirect)
    {
        redirect($path.$redirect);
    }
endif;
