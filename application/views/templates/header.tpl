<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>{$title}</title>

    <link rel="stylesheet" href="{$base_url}assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="{$base_url}assets/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="{$base_url}assets/css/budgettracker/budget.css" />

    <script type="text/javascript" src="{$base_url}assets/js/jquery.min.js"></script> 
    <script type="text/javascript" src="{$base_url}assets/js/jquery.dataTables.min.js"></script> 
    <script type="text/javascript" src="{$base_url}assets/js/dataTables.bootstrap4.min.js"></script>  
    <script type="text/javascript" src="{$base_url}assets/js/budgettracker/budget.js"></script> 
    <script type="text/javascript" src="{$base_url}assets/js/holder.js"></script> 
</head>
<body class="body-bg">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                {include file="menu.tpl"}
            </div>
            <div class="span8 body">
                {if isset($error) && !empty($error)}
                    <div class="alert alert-danger">{$error}</div>
                {/if}
                {if isset($message) && !empty($message)}
                    <div class="alert alert-success">{$message}</div>
                {/if}