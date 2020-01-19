{include file="header.tpl"}
    <div class="head-section">
        <h4 class="head text-success">Budget</h4>  
        <p class="text-light"><small>Household Budget Tracking</small></p>  
        <select id="inputBudgetMonth">
            {foreach from=$list_month key=m item=val}
                <option value="{$val}" {if $month == $m}selected="selected"{/if}>{$m}</option>
            {/foreach}
        </select>
        <select id="inputBudgetYear">
            {for $y=($year-10) to $year}
                <option value="{$y}" {if $year == $y}selected="selected"{/if}>{$y}</option>
            {/for}
        </select>
    </div>
    
    <div class="content-section">
        <div class="head-section">
            
            <div class="row-fluid">
                <div class="span3">
                    <div class="">Total Actual Income</div>
                    <div id="total-income" class="bg-white"></div>
                    <input type="hidden" id="totalincome">
                </div>
                <div class="span3">
                    <div class="">Total Actual Expenses</div>
                    <div id="total-expense" class="bg-white"></div>  
                    <input type="hidden" id="totalexpense">
                </div>
                <div class="span3">
                    <div class="text-success">Total Actual Balances</div>
                    <div id="total-balance" class="bg-green"></div>
                </div>
            </div>
        </div>
        <div class="content-table">
            <div class="sub-head">Summary by Category</div>
            <div class="head text-success">Income</div>
            <table id="income" class="table table-responsive table-bordered" width="100%">
                <thead>
                    <tr>
                        <th class="text-center">Category</th>
                        <th class="text-center">Budget</th>
                        <th class="text-center">Actual</th>
                        <th class="text-center">Difference</th>
                    </tr>
                </thead>
            </table>
            
            <br/>
            <div class="head text-success">Expenses</div>
            <table id="expense" class="table table-responsive table-bordered" width="100%">
                <thead>
                    <tr>
                        <th class="text-center">Category</th>
                        <th class="text-center">Budget</th>
                        <th class="text-center">Actual</th>
                        <th class="text-center">Difference</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
{include file="footer.tpl"}