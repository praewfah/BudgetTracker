<ul class="nav nav-list side-bar affix">
    <li class="nav-header text-center">
        <img src="{$base_url}/assets/img/icon_money.png" class="img-rounded" data-src="holder.js/128x128" style="width: 128px;height: 128px;"/>
    </li>
    <li {if $page == "budget"}class="active"{/if}>
        <a href="{$base_url}budget/budget">
            <i class="icon icon-star"></i> Budget
        </a>
    </li>
    <li {if $page == "transection"}class="active"{/if}>
        <a href="{$base_url}budget/transection">
            <i class="icon icon-star"></i> Cash Flow
        </a>
    </li>
    <li>
        <a href="{$base_url}budget/add_budget" class="btn btn-light mt-10">
            <i class="icon icon-plus-sign"></i> Add Budget
        </a>
    </li>
    <li>
        <a href="{$base_url}budget/add_transection" class="btn btn-light mt-10">
            <i class="icon icon-plus-sign"></i> Add Transection
        </a>
    </li>
</ul>