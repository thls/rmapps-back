devise_for :users,
  skip: [:registrations, :passwords],
  path: 'auth',
  path_names: { sign_in: 'sign_in', sign_out: 'sign_out' },
  controllers: {
    sessions: 'auth/sessions'
  }
