LINKS

1) https://pragmaticstudio.com/blog/2015/3/18/rails-jquery-ajax (ajax & query with rails)

2) http://stackoverflow.com/questions/7288669/jquery-div-show-delay5000-hide-doesnt-work (setTimeout)

3) http://www.w3schools.com/howto/howto_css_animated_search.asp (for search bar)

CHALLENGES

We have to address browser incompatibility(mozilla, safari, chrome etc) with respect to CSS and HTML and especially concentrate on Internet Explorer. “placeholder” has browser incompatibility issues. I have not explicitly addressed this issue, but the code works for Safari. 
The autoprefixer gem in Rails might help us with these issues(webkit), but we have to do more research on this.

DISCOVERIES

Updating to a rails version with Turbolinks can potentially cause issues with existing jQuery code. The primary issue is with jQuery that is invoked in the ready() function( $(document).ready() )

In the context of a Turbolinks application this will only be triggered on an initial page load or refresh (i.e. not after any subsequent Turbolink controlled link clicks).

There are many ways to get around this issue including using gems and changing the $(document).ready() etc. But the solution that I found which works perfectly with Rails 5 is in the javascript file I have attached( $(document).on('turbolinks:load', function(){……….}); ) Check it out. The other methods mentioned on the Internet are somewhat outdated and don’t work properly with Rails 5.

PS : Reply if you find any mistakes or if you want explanations for search bar expansion or anything else.
