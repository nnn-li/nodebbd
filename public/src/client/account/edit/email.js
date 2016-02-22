'use strict';

/* globals define, ajaxify, socket, app  */

define('forum/account/edit/email', ['forum/account/header'], function(header) {
	var AccountEditEmail = {};

	AccountEditEmail.init = function() {
		header.init();

		$('#submitBtn').on('click', function () {
			var userData = {
				uid: $('#inputUID').val(),
				email: $('#inputNewEmail').val(),
				password: $('#inputCurrentPassword').val()
			};

			if (!userData.email) {
				return;
			}

			var btn = $(this);
			btn.addClass('disabled').find('i').removeClass('hide');

			socket.emit('user.changeUsernameEmail', userData, function(err) {
				btn.removeClass('disabled').find('i').addClass('hide');
				if (err) {
					return app.alertError(err.message);
				}

				ajaxify.go('user/' + ajaxify.data.userslug);
			});

			return false;
		});
	};

	return AccountEditEmail;
});
