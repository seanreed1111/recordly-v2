.nav-collapse.collapse
  %ul.nav
    %li.active
      %a{:href => "#"} Home
    %li.dropdown
      %a.dropdown-toggle{:href => "#", "role" => "button", "data-toggle" => "dropdown", "data-target" => "#"} 
        The dropdown item
        %b.caret
      %ul.dropdown-menu{"role" => "menu"}
        %li
          %a{:href => "#link1"} 
            Dropdown #1
          %a{:href => "#link2"} 
            Dropdown #2
          %a{:href => "#link3"} 
            Dropdown #3
          %a{:href => "#link4"} 
            Dropdown #4
    %li
      %a{:href => "#contact"} Contact
##################


topbar-wrapper{:style => "z-index: 5;"}
  .topbar{"data-dropdown" => "dropdown"}
    .topbar-inner
      .container
        %h3
          = link_to 'Project', root_path
        %ul.nav
          %li
            = link_to 'Home', '#', {:class => 'active'}
            = link_to 'Link', '#'
          %li
            = link_to 'Apps', applications_path
          %ul{:class => "nav secondary-nav"}
            %li.dropdown
              = link_to 'Dropdown', '#', {:class => 'dropdown-toggle'}
              %ul.dropdown-menu
                %li
                  = link_to 'Secondary Link', '#'
                %li
                  = link_to 'Something else here', '#'
                %li.divider
                %li
                  = link_to 'Another link', '#'
        %form.pull-left{:action => ""}
          %input{:placeholder => "Search"}
        %ul{:class => "nav secondary-nav"}
          %li.dropdown
            = link_to 'Dropdown', '#', {:class => 'dropdown-toggle'}
            %ul.dropdown-menu
              %li
                = link_to 'Secondary link', '#'
              %li
                = link_to 'Something else here', '#'
              %li.divider
              %li
                = link_to 'Another link', '#'


##################

.collapse.navbar-collapse
  %ul.nav.navbar-nav
    %ul.nav
      %li.dropdown
        = link_to 'Your Albums', albums_path, class: "dropdown-toggle"
        %ul.dropdown-menu
          %li.divider
          %li=link_to "Add New Album", new_album_path
  %li{:class => 'inactive' }= link_to 'Your Artists', artists_path
  %li{:class => 'inactive'}= link_to 'Your Songs', songs_path
  %li{:class => 'inactive'}= link_to 'Show Favorites', favorites_index_path


HTML output

HTML output (Bootstrap)

<ul class="nav">
  <li class="active">
    <a href="#">Home</a>
  </li>
  <li class="dropdown">
    <a role="button" href="#" data-toggle="dropdown" data-target="#" class="dropdown-toggle">
      The dropdown item
      <b class="caret"></b>
    </a>
    <ul role="menu" class="dropdown-menu">
      <li>
        <a href="#link1">
          Dropdown #1
        </a>
        <a href="#link2">
          Dropdown #2
        </a>
        <a href="#link3">
          Dropdown #3
        </a>
        <a href="#link4">
          Dropdown #4
        </a>
      </li>
    </ul>
  </li>
  <li>
    <a href="#contact">Contact</a>
  </li>
</ul>








/for dropdown menus, 
/if you want to highlight a menu item no matter what method you are running inside the same controller, you could use @Pierre solution: 'active' if params[:controller] == 'controller1'
/Make sure that adding the below is an option from a dropdown somewhere.
/albums
/songs
/artists
/favorites
/https://stackoverflow.com/questions/9879169/how-to-get-twitter-bootstrap-navigation-to-show-active-link