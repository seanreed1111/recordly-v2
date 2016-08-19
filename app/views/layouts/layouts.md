/for dropdown menus, 
/if you want to highlight a menu item no matter what method you are running inside the same controller, you could use @Pierre solution: 'active' if params[:controller] == 'controller1'
/Make sure that adding the below is an option from a dropdown somewhere.
/albums
/songs
/artists
/favorites
/https://stackoverflow.com/questions/9879169/how-to-get-twitter-bootstrap-navigation-to-show-active-link