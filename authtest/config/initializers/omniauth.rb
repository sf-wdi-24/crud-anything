Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "975478942513157", "f2bc9299933b3075cc7aaa39977e8841"
  provider :identity, :fields => :email
end