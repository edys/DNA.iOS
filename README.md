# Helix.iOS

At the moment there seems to only be two type of mobile apps...

Native and HTML...

Most business tend to try native... and them move to HTML to save cost on dev and testing (which in the long run doesn't work). 
I decided that there must be a middle ground, and as i have not heard of it, i decided to create it my self as a POC. 

This POC is more of a way of satisfying my curiosity.

The idea is to use rest service to describe the layout of the views, to return the data for each view and key resources that are needed.

layout = common view models that can be built (like lego) block with each other that describe layouts, these view models will them be translated into HTML/JS (web), UIView/UIViewController (iOS), Activities/Fragments (Android).

data = json data objects

key resources = images, text (cached on each platform when approperite)

The end idea is to create a eco system of common building blocks that can be used to quickly create new flows that have a consistent look and feel. 

This project will consist of:
 - Helix.RestServices
 - Helix.Web
 - Helix.Android
 - Helix.iOS
