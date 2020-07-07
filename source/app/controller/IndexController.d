module app.controller.IndexController;

import hunt.framework;

class IndexController : Controller
{
    mixin MakeController;

    @Action
    string index()
    {
        view.assign("version", HUNT_VERSION);
        
        return view.render("index");
    }
}
