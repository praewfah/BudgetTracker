{include file="header.tpl"}
    <div class="head-section">
        <h4 class="head text-success">Cash Flow</h4>  
        <p class="text-light"><small>Household Budget Tracking</small></p> 
        <div class="form-search">
            Date from : 
            <input type="text" name="date_from" id="date-from" value="{$date_from}">
            Date to : 
            <input type="text" name="date_to" id="date-to" value="{$date_to}">
            <button type="submit" class="btn" id="search-transection">Search</button>
        </div>
    </div>
    
    <div class="content-section">
        <div class="content-table">
            <div class="sub-head">Transection</div>
            <table id="transection" class="table table-responsive table-bordered" width="100%">
                <thead>
                    <tr>
                        <th class="text-center">Date</th>
                        <th class="text-center">Category</th>
                        <th class="text-center">Description</th>
                        <th class="text-center">Type</th>
                        <th class="text-center">Amount</th>
                    </tr>
                </thead>
            </table>
            </div>
    </div>

{include file="footer.tpl"}