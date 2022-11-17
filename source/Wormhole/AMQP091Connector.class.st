"
I'm an AMQP connector, implementing the AMQP 091 protocol.

I know the host, port and basic credentials needed to deploy an AMQP Client and connect to a RabbitMQ Broker.
"
Class {
	#name : #AMQP091Connector,
	#superclass : #Object,
	#instVars : [
		'name',
		'host',
		'port',
		'username',
		'password',
		'timeoutDelayInSeconds'
	],
	#category : #Wormhole
}

{ #category : #'instance creation' }
AMQP091Connector class >> named: aName hostedIn: aHost on: aPort identifiedBy: aUsername and: aPassword delayingUpTo: aDuration [

	AssertionCheckerBuilder new
		failFast;
		raising: InstanceCreationFailed;
		checking: [ :anAsserter | 
			anAsserter
				refuse: [ aName trimBoth isEmpty ] because: 'Name cannot be blank.';
				refuse: [ aHost trimBoth isEmpty ] because: 'Host cannot be blank.';
				enforce: [ aPort strictlyPositive ] because: 'Port must be positive.';
				refuse: [ aUsername trimBoth isEmpty ] because: 'Username cannot be blank.';
				refuse: [ aPassword trimBoth isEmpty ] because: 'Password cannot be blank.';
				enforce: [ aDuration positive ] because: 'Timeout delay must be positive.'
			];
		buildAndCheck.

	^ self new
		  initializeNamed: aName
		  hostedIn: aHost
		  on: aPort
		  identifiedBy: aUsername
		  and: aPassword
		  delayingUpTo: ( Duration seconds: aDuration asSeconds )
]

{ #category : #accessing }
AMQP091Connector >> host [

	^ host
]

{ #category : #initialization }
AMQP091Connector >> initializeNamed: aName hostedIn: aHost on: aPort identifiedBy: aUsername and: aPassword delayingUpTo: aDuration [

	name := aName.
	host := aHost.
	port := aPort.
	username := aUsername.
	password := aPassword.
	timeoutDelayInSeconds := aDuration
]

{ #category : #accessing }
AMQP091Connector >> name [

	^ name
]

{ #category : #accessing }
AMQP091Connector >> password [

	^ password
]

{ #category : #accessing }
AMQP091Connector >> port [

	^ port
]

{ #category : #printing }
AMQP091Connector >> printOn: aStream [

	aStream nextPutAll: ( '<1s>''s AMQP 091 connector for <2s>:<3p>, granting access to <4s>'
			  expandMacrosWith: self name
			  with: self host
			  with: self port
			  with: self username )
]

{ #category : #accessing }
AMQP091Connector >> timeoutDelayInSeconds [

	^ timeoutDelayInSeconds
]

{ #category : #accessing }
AMQP091Connector >> username [

	^ username
]
