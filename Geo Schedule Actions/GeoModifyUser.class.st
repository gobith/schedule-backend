Class {
	#name : #GeoModifyUser,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #actions }
GeoModifyUser >> addTo: aSchedule [

	| user |
	user := aSchedule users at: (payload at: 'id').
	payload at: 'name' ifPresent: [ :name | user name: name ].
	payload at: 'surname' ifPresent: [ :surname | user surname: surname ].
	payload at: 'email' ifPresent: [ :email | user email: email ].
	payload at: 'phone' ifPresent: [ :phone | user phone: phone ].
	payload at: 'password' ifPresent: [ :password | user password: password ].
	payload at: 'role' ifPresent: [ :role | user role: role ].
	payload at: 'websiteRole' ifPresent: [ :websiteRole | user websiteRole: websiteRole ].
	^ user
]
