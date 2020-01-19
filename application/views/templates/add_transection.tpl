{include file="header.tpl"}
    <div class="head-section">
        <h4 class="head">Add Transaction</h4>                      
        <p class="text-light"><small>Household Budget Tracking</small></p>   
    </div>
    
    <div class="content-section">
        <div class="alert alert-info">
            <b>HOW TO USE:</b> 
            Enter your information into the Transactions.
            * Please fill out the required field
        </div>
        <form class="form-horizontal" action="{$base_url}budget/save_transection" method="POST">
            <div class="control-group">
                <label class="control-label" for="inputBudgetDate">Date</label>
                <div class="controls">
                    <input type="text" id="inputBudgetDate" name="transection_date" value="{$today}" required> 
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
                <label class="control-label" for="inputBudgetDescription">Description</label>
                <div class="controls">
                    <textarea rows="3" id="inputBudgetDescription" name="description" required></textarea>
                    <span class="text-info"><small>*</small></span>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputBudgetActual">Actual</label>
                <div class="controls">
                    <input type="text" id="inputBudgetActual" name="actual" placeholder="1700" required>
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