# background-color-image-effect
Change the background color of an UIView according to the image inside the UIImageView.

> COPYRIGHT NOTICE: ALL IMAGES INSIDE THIS REPOSITORY BELONG TO [LIAM WONG](https://twitter.com/liamwong)!

When you swipe through photos inside the Twitter app on iOS the color of the view changes according to the image. This effect is also visible on their website. Check out this tweet, swipe through the pictures and pay attention to the color of the view: [photo example](https://twitter.com/Procreate/status/1166677128173109249)

I wanted to reproduce this effect. I've used the [average color](https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage) of the image and [darkend it](https://stackoverflow.com/questions/38435308/get-lighter-and-darker-color-variations-for-a-given-uicolor
) by 15%.

You find the code inside the ```UIColor+UIImage+Extension.swift``` file.
