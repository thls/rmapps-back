devise_for :users,
  skip: [:registrations, :passwords],
  path: 'auth',
  path_names: { sign_in: 'redu/sign_in', sign_out: 'redu/sign_out' },
  controllers: {
    sessions: 'auth/sessions'
  }
