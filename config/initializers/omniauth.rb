
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1824870307787335', 'f276085a15e3781211db0cbff46e79bb',
	:image_size => 'large'

	provider :google_oauth2, '871595270128-chu2b6u3cl46u18d5tv6qa4rkhtrhbjd.apps.googleusercontent.com',
	's18fXeqeK6p-5v-QCdoo0FCl'
end
