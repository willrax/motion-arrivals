class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # Add your token and preferred channel.
    App::Persistence[:slack_token] = ""
    App::Persistence[:channel] = ""

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = BeaconController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
