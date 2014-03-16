# Motion Arrivals

iBeacons, RubyMotion, SlackHQ. Oh my!

![friends](http://media.giphy.com/media/SKhNHgpJzthII/giphy.gif)


A simple example app used in my iBeacon talk at [#sydinmotion](http://sydinmotion.com).

## Usage

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
