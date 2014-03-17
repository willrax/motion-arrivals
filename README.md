# Motion Arrivals

iBeacons, RubyMotion, SlackHQ. Oh my!

![friends](http://media.giphy.com/media/SKhNHgpJzthII/giphy.gif)


A simple example app used in my iBeacon talk at [#sydinmotion](http://sydinmotion.com). No longer will your colleagues be wondering when you arrive in the office!

![](http://c.willrax.com/USha/2014-03-16%2013_02_15.gif)

## Usage

There is a more in-depth guide [here](https://github.com/willrax/motion-arrivals/wiki/Setup-and-Usage)

Just fill in your slackbot remote control token and preferred channel in `app_delegate.rb`.

```ruby
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    App::Persistence[:slack_token] = "TOKEN"
    App::Persistence[:channel] = "CHANNEL"

    # ...
  end
end
```

You'll want to have some sort of iBeacon running near your desk / office. I would recommend this Mac OSX app [https://github.com/lgaches/BeaconEmitter](https://github.com/lgaches/BeaconEmitter).
