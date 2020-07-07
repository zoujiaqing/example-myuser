module app.controller.api.UserController;

import hunt.framework;

import app.repository.UserRepository;
import app.model.User;
import app.message.ResultMessage;
import app.form.UserForm;

class UserController : Controller
{
    mixin MakeController;

    @Action
    Response add(UserForm form)
    {
        // ResultMessage is the body of the JSON message to be returned
        auto resultMessage = new ResultMessage;

        // Use the valid () method to get a verification result object
        auto valid = form.valid();
        if (!valid.isValid())
        {
            // Set an error code
            resultMessage.code = 10001;

            // The valid.messages() method can get all the error information. Here we simply get one error and return it
            foreach (message; valid.messages())
            {
                resultMessage.message = message;
                break;
            }
        }
        else
        {
            auto repository = new UserRepository;

            auto user = new User;
            user.username = form.username;
            user.password = form.password;
            user.email = form.email;

            // Save model data to database
            repository.save(user);

            // Because there is no error, you don`t need to set the error code.
            import std.format : format;

            resultMessage.message = format!"User (% d) added successfully!"( user.id );
        }

        // The returned result object is automatically serialized by JsonResponse to JSON and returned to the client
        return new JsonResponse(resultMessage);
    }

    @Action
    Reponse del(ulong id)
    {
        //
        auto result = new ResultMessage;
        result.message = "Delete success!";

        return new JsonResponse(result);
    }

    @Action
    Response mod()
    {
        //
        auto result = new ResultMessage;
        result.message = "Modify success!";

        return new JsonResponse(result);
    }

    @Action
    Response detail(ulong id)
    {
        //
        auto result = new ResultMessage;
        result.message = "Modify success!";

        return new JsonResponse(result);
    }

    @Action
    Response list()
    {
        //
        auto result = new ResultMessage;
        result.message = "Modify success!";

        return new JsonResponse(result);
    }
}
