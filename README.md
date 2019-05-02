# Coordinator

[![CI Status](https://img.shields.io/travis/rafael-silva/Coordinator.svg?style=flat)](https://travis-ci.org/rafael-silva/Coordinator)
[![Version](https://img.shields.io/cocoapods/v/Coordinator.svg?style=flat)](https://cocoapods.org/pods/Coordinator)
[![License](https://img.shields.io/cocoapods/l/Coordinator.svg?style=flat)](https://cocoapods.org/pods/Coordinator)
[![Platform](https://img.shields.io/cocoapods/p/Coordinator.svg?style=flat)](https://cocoapods.org/pods/Coordinator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Coordinator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Coordinator'
```

I used a protocol for coordinators in this example:
```swift
protocol Coordinator:class {
    func start()
}
```
The base coordinator stores dependencies of child coordinators
```swift
class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {}
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator}
    }
    
}
```
In this example I use factories for creating  coordinators and controllers (we can mock them in tests).
```swift
protocol CoordinatorFactory {
    func makeMoviesUpcomingCoordinator(router: Router) -> Coordinator
}

```
AppDelegate store lazy reference for the Application Coordinator
```swift
    var rootController: UINavigationController {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        window?.rootViewController = custonNavigationController
        
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var appCoordinator: Coordinator = self.makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(
            router: RouterImp(rootController: rootController),
            coordinatorFactory: CoordinatorFactoryImp()
        )
    }
```

## Author

rafael-silva, rafael.matos@involves.com.br

## License

Coordinator is available under the MIT license. See the LICENSE file for more info.
