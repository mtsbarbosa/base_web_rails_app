(->
	angular
		.module('app', [])

	###
	class WelcomeController
		changeText: ()->
			$('#teste').text('teste');

			return

	angular
		.module('app')
		.controller('WelcomeController', WelcomeController)
	###

)()