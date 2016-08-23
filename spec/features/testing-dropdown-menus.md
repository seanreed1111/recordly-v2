Capybara Cheatsheet
https://gist.github.com/zhengjia/428105
https://github.com/jnicklas/capybara/blob/3ae284460b1af35d40b077bf14f7222c2982c120/lib/capybara/spec/session/has_select_spec.rb
see#####
If you take a look at the source of the select method, you can see that what it does when you pass a from key is essentially:

find(:select, from, options).find(:option, value, options).select_option
In other words, it finds the <select> you're interested in, then finds the <option> within that, then calls select_option on the <option> node.

You've already pretty much done the first two things, I'd just rearrange them. Then you can tack the select_option method on the end:

--->> find('#organizationSelect').find(:xpath, 'option[2]').select_option



See - Also
Hello I figured it out eventually. I had to use xpath to find the link. Based on the html above, here is what I did:


<li class="dropdown">
       <a class="dropdown-toggle" data-toggle="dropdown">
        Welcome <%= current_user.first_name + " "+ current_user.last_name%>
        <b class="caret"></b>
     </a>
    <ul class="dropdown-menu">
         <a href="#">
        <%= link_to "Sign out", destroy_user_session_path, :method => :delete%> 
        </a>
    </ul>
</li>

In rspec, I wrote:

page.find(:xpath, "//a[@href='/users/sign_out']").click
The reason I use "//a[@href='/users/sign_out']" is because the link_to "Sign out", destroy_user_session_path, :method => :delete is compiled to <a href="/users/sign_out" ... on the web page.

And it works :-)

Oh by the way, I found this useful link: http://www.suffix.be/blog/click_image_in_link_capybara