let user = {
	init: function() {
		$("#btn-login").bind("click", () => {
			this.login();
		});
	},

	login: function() {
		let data = {
			userId: $("#userId").val(),
			password: $("#password").val()
		}

		console.log(data.userId);
		console.log(data.password);

		$.ajax({
			type: "POST",
			url: "/security/login",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			console.log(response.data);
			if (response.data.userId == null) {
				alert("아이디와 비밀번호를 확인해주세요");
			} else {
				location.href = "/security/join_form";
			}
		}).fail(function(error) {
			alert("다시 시도해주세요.");
		});
	}
}

user.init();
