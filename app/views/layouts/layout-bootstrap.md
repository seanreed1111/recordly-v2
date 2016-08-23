.dropdown
  %button#dropdownMenu1.btn.btn-default.dropdown-toggle{"aria-expanded" => "true", "aria-haspopup" => "true", "data-toggle" => "dropdown", :type => "button"}
    Dropdown
    %span.caret
  %ul.dropdown-menu{"aria-labelledby" => "dropdownMenu1"}
    %li
      %a{:href => "#"} Action
    %li
      %a{:href => "#"} Another action
    %li
      %a{:href => "#"} Something else here
    %li.divider{:role => "separator"}
    %li
      %a{:href => "#"} Separated link


<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    Dropdown
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>