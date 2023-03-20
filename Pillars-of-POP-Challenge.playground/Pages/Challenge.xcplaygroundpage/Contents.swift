class PaymentController {
    let services: [Service]
    init(services: [Service]) {
        self.services = services
    }
    
    func calculateEarnings() -> Float {
        /*var result: Float = 0
        services.forEach{ (service) in
            result += service.total
        }
        return result*/
        services.reduce(0) { $0 + $1.total }
    }
}

var amazonService = make(service: .amazon) //AmazonService()
var etsyService = make(service: .etsy) //EtsyService()

let controller = PaymentController(services: [amazonService, etsyService])

amazonService.add(payment: 100)
etsyService.add(payment: 25)
amazonService.add(payment: 12.50)

print("Total earned: \(controller.calculateEarnings())")
