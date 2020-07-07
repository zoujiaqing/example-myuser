module app.model.User;

import hunt.entity;

@Table("users")
class User : Model
{
    mixin MakeModel;

    @AutoIncrement
    @PrimaryKey
    ulong id;

    string username;
    string password;
    string email;
    
    uint created;
    uint updated;
}
