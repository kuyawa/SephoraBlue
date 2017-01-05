import Kitura
import LoggerAPI
import HeliumLogger
import KituraStencil


print("\n----------\nRunning Kitura dev...\n")

HeliumLogger.use()
Log.logger = HeliumLogger()

let router = Router()
let stencil = StencilTemplateEngine(namespace: App.getStencilFilters())

router.setDefault(templateEngine: stencil)
router.all("/static", middleware: StaticFileServer())

// Routes
router.get("/", handler: IndexHandler().index)
router.get("/index", handler: IndexHandler().index)
router.get("/test",  handler: TestHandler().show)

Kitura.addHTTPServer(onPort: 8090, with: router)

Kitura.run()

