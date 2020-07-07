module app.form.UserForm;

import hunt.framework;

class UserForm : Form
{
    mixin MakeForm;

    @Length (4, 30, "user name length must be between {min} and {Max}} bits.")
    string username;

    @Length (8, 32, "password length must be between {min} and {Max} bits.")
    string password;

    @Notempty ("email address cannot be empty.")
    string email;
}
