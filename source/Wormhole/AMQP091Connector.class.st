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
AMQP091Connector class >> named: aName hostedIn: aHost [

	AssertionChecker
		refuse: [ aName trimBoth isEmpty ]
		because: 'Name cannot be blank.'
		raising: InstanceCreationFailed.

	InstanceCreationFailed signal: 'Host cannot be blank.'
]
