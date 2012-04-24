== Rails Admin Custom Action Example

This is a fork of [dummy_app](https://github.com/bbenezech/dummy_app) which uses [rails_admin](https://github.com/sferik/rails_admin) to provide a full backend.

At this example, we created a published field for comments and a bulk action to publish multiple comments at the same time.

The relevant files, which you should take a close look are:

* config/initializers/rails_admin.rb
* lib/rails_admin_publish.rb