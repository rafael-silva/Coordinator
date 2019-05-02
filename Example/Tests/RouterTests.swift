import UIKit
import Quick
import Nimble

@testable import Coordinator

class RouterTest: QuickSpec {

    override func spec() {

        var router: RouterMock!
        var firstController: UIViewController!
        var secondController: UIViewController!
        
        describe("Router") {
            
            beforeEach {
                router = RouterMockImp()
                firstController = ViewControllerOne()
                secondController = ViewControllerTwo()
            }

            it("must set root module") {
                router!.setRootModule(firstController)
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
            }


            it("must push view module") {
                router!.setRootModule(firstController)
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
                router!.push(secondController)
                expect(router.navigationStack.last is ViewControllerTwo).toEventually(beTrue())
            }

            it("must pop view module") {
                router.setRootModule(firstController)
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
                router!.push(secondController)
                expect(router.navigationStack.last is ViewControllerTwo).toEventually(beTrue())

                router!.popModule()
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
            }

            it("must pop to root view module") {
                router!.setRootModule(firstController)
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
                router!.push(secondController)
                expect(router.navigationStack.last is ViewControllerTwo).toEventually(beTrue())

                router!.popModule(animated: true)
                expect(router.navigationStack.first is ViewControllerOne).to(beTrue())
            }

            it("must present view module") {
                router!.present(secondController)
                expect(router.presented is ViewControllerTwo).toEventually(beTrue())
            }

            it("must dismiss view module") {
                router!.present(secondController)
                expect(router.presented is ViewControllerTwo).toEventually(beTrue())

                router!.dismissModule()
                expect(router.presented).toEventually(beNil())
            }

        }
    }
}

private final class ViewControllerOne: UIViewController, BaseView {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

private final class ViewControllerTwo: UIViewController, BaseView {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

