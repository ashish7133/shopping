var app = angular.module('ShoppingApp', []);

app.controller('ProductController', function($http) {

	var me = this;

	me.mvProducts = [];
	me.mpProducts = [];

	me.fetchProducts = function() {

		$http.get('/shopping/json/data/mv/products').then(function(response) {
			me.mvProducts = response.data;
		});

		$http.get('/shopping/json/data/mp/products').then(function(response) {
			me.mpProducts = response.data;
		});

	}

});