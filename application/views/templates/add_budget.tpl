{include file="header.tpl"}
    <div class="head-section">
        <h4 class="head">Add Budget</h4>                      
        <p class="text-light"><small>Household Budget Tracking</small></p>   
    </div>
    
    <div class="content-section">
        <div class="alert alert-info">
            <b>HOW TO USE:</b> 
            Enter your budget for each category on the period. 
            * Please fill out the required field
        </div>
        <form class="form-horizontal" action="{$base_url}budget/save_budget" method="POST">
            <div class="control-group">
                <label class="control-label" for="inputBudgetDateFrom">Budget For</label>
                <div class="controls">
                    <select id="inputBudgetDateFrom" name="budget_month" required>
                        {foreach from=$list_month key=m item=val}
                            <option value="{$val}" {if $month == $m}selected="selected"{/if}>{$m}</option>
                        {/foreach}
                    </select>
                    <select id="inputBudgetDateTo" name="budget_year" required>
                        {for $y=($year-10) to $year}
                            <option value="{$y}" {if $year == $y}selected="selected"{/if}>{$y}</option>
                        {/for}
                    </select>
                    <span class="text-info"><small>*</small></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputBudgetType">Type</label>
                <div class="controls">
                    <select id="inputBudgetType" name="budget_type" required>
                        <option value="">--</option>
                        <option value="Income">Income</option>
                        <option value="Expense">Expense</option>
                    </select>
                    <span class="text-info"><small>*</small></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputBudgetCategory">Category</label>
                <div class="controls">
                    <select id="inputBudgetCategory" class="disabled" disabled="disabled"></select>
                    <select id="inputBudgetCategoryExpense" style="display:none" name="budget_category" disabled="disabled" required>
                        <option value="">--</option>
                        <option value="Auto">Auto</option>
                        <option value="Electricity">Electricity</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Food">Food</option>
                        <option value="Home">Home</option>
                        <option value="Household repairs">Household repairs</option>
                        <option value="Loans">Loans</option>
                        <option value="Medical">Medical</option>
                        <option value="Oil/Gas">Oil/Gas</option>
                        <option value="Personal Items">Personal Items</option>
                        <option value="Rent/Mortgage/Insurance">Rent/Mortgage/Insurance</option>
                        <option value="Savings">Savings</option>
                        <option value="Telephone/Internet">Telephone/Internet</option>
                        <option value="Travel">Travel</option>
                        <option value="Utilities">Utilities</option>
                        <option value="Water">Water</option>
                        <option value="Other">Other</option>
                    </select>
                    <select id="inputBudgetCategoryIncome" style="display:none" name="budget_category" disabled="disabled" required>
                        <option value="">--</option>
                        <option value="Salary">Salary</option>
                        <option value="Spouse Salary">Spouse Salary</option>
                        <option value="Bonus">Bonus</option>
                        <option value="Dividens">Dividens</option>
                        <option value="Gifts Received">Gifts Received</option>
                        <option value="Interest">Interest</option>
                        <option value="Investing Income">Investing Income</option>
                        <option value="Reimbursements">Reimbursements</option>
                        <option value="Other">Other</option>
                    </select>
                    <span class="text-info"><small>*</small></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputBudgetAmount">Budget</label>
                <div class="controls">
                    <input type="text" id="inputBudgetAmount" name="budget_amount" placeholder="1500" required>
                    <span class="text-info"><small>*</small> <small>Allow digits only</small></span>    
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </form>
    </div>

{include file="footer.tpl"}