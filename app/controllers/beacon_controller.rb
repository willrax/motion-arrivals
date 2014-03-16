class BeaconController < UIViewController
  attr_reader :region, :manager, :last_broadcast

  def viewDidLoad
    super
    @last_broadcast = Time.now - 120
    location_manager.startMonitoringForRegion(beacon_region)
  end

  def locationManager(manager, didEnterRegion: region)
    manager.startRangingBeaconsInRegion(region) if region.isKindOfClass(CLBeaconRegion)
  end

  def locationManager(manager, didExitRegion: region)
    if region.isKindOfClass(CLBeaconRegion)
      manager.stopRangingBeaconsInRegion(region)
      Broadcast.new("Office Departure: willrax" ).send
    end
  end

  def locationManager(manager, didRangeBeacons: beacons, inRegion: region)
    if last_broadcast < (Time.now - 120)
      if beacons.last.proximity == CLProximityNear
        Broadcast.new("Office Arrival: willrax" ).send
        @last_broadcast = Time.now
      end
    end
  end

  def beacon_region
    uuid = NSUUID.alloc.initWithUUIDString("F5207020-EF2B-4447-991D-A2057F6E0D4C")
    beacon = CLBeaconRegion.alloc.initWithProximityUUID(uuid, identifier: "com.willrax.slackers")
    beacon.notifyOnEntry = true
    beacon.notifyOnExit = true
    beacon.notifyEntryStateOnDisplay = true
    beacon
  end

  def location_manager
    @location_manager ||= CLLocationManager.alloc.init.tap do |manager|
      manager.delegate = self
    end
  end
end
