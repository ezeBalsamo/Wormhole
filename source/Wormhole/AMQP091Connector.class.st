"
I'm an AMQP connector, implementing the AMQP 091 protocol.

I know the host, port and basic credentials needed to deploy an AMQP Client and connect to a RabbitMQ Broker.
"
Class {
	#name : #AMQP091Connector,
	#superclass : #Object,
	#category : #Wormhole
}

{ #category : #'instance creation' }
AMQP091Connector class >> named: aName hostedIn: aHost on: aPort identifiedBy: aUsername and: aPassword delayingUpTo: aDurationInSeconds [

	AssertionCheckerBuilder new
		failFast;
		raising: InstanceCreationFailed;
		checking: [ :anAsserter | 
			anAsserter
				refuse: [ aName trimBoth isEmpty ] because: 'Name cannot be blank.';
				refuse: [ aHost trimBoth isEmpty ] because: 'Host cannot be blank.';
				enforce: [ aPort strictlyPositive ] because: 'Port must be positive.';
				refuse: [ aUsername trimBoth isEmpty ] because: 'Username cannot be blank.';
				refuse: [ aPassword trimBoth isEmpty ] because: 'Password cannot be blank.'
			];
		buildAndCheck.

	InstanceCreationFailed signal: 'Timeout delay must be positive.'
]
