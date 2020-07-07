module app.repository.UserRepository;

import hunt.framework;

import app.model.User;

class UserRepository : EntityRepository!(User, ulong)
{
    this()
    {
        super(defaultEntityManager());
    }
}
