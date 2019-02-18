
HL_COMPOSER_CLI=$(which composer)
PRIVATE_KEY=../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/f10b4fe06bcfa73a2693029e596badf9939c429637e53f966c06f87dda73be0f_sk
CERT=../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
cat << EOF > connection.json
{
    "name": "hlfv1",
    "x-type": "hlfv1",
    "x-commitTimeout": 300,
    "version": "1.0.0",
    "client": {
        "organization": "Org1",
        "connection": {
            "timeout": {
                "peer": {
                    "endorser": "300",
                    "eventHub": "300",
                    "eventReg": "300"
                },
                "orderer": "300"
            }
        }
    },
    "channels": {
        "mychannel": {
            "orderers": [
                "orderer0.example.com"
            ],
            "peers": {
                 "peer0.org1.example.com": {
                    "endorsingPeer": true,
                    "chaincodeQuery": true,
                    "eventSource": true
                },
                "peer1.org1.example.com": {
                    "endorsingPeer": true,
                    "chaincodeQuery": true,
                    "eventSource": true
                },
                "peer0.org2.example.com": {
                    "endorsingPeer": true,
                    "chaincodeQuery": true,
                    "eventSource": true
                },
                "peer1.org2.example.com": {
                    "endorsingPeer": true,
                    "chaincodeQuery": true,
                    "eventSource": true
                }
            }
        }
    },
       "organizations": {
        "Org1": {
            "mspid": "Org1MSP",
            "peers": [
                "peer0.org1.example.com",
                "peer1.org1.example.com"
            ],
            "certificateAuthorities": [
                "ca.org1.example.com"
            ]
        },
        "Org2": {
            "mspid": "Org2MSP",
            "peers": [
                "peer0.org2.example.com",
                "peer1.org2.example.com"
            ]
        }
    },
    "orderers": {
        "orderer0.example.com": {
            "url": "grpc://localhost:7050",
            "grpcOptions": {
               "ssl-target-name-override": "orderer0.example.com"
            },
            "tlsCACerts": {
                "pem": "-----BEGIN CERTIFICATE-----\nMIICNTCCAdugAwIBAgIQZhgSoy7kzd36scJL0bJu7zAKBggqhkjOPQQDAjBsMQsw\nCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy\nYW5jaXNjbzEUMBIGA1UEChMLZXhhbXBsZS5jb20xGjAYBgNVBAMTEXRsc2NhLmV4\nYW1wbGUuY29tMB4XDTE5MDEwNzA4MDYyMFoXDTI5MDEwNDA4MDYyMFowbDELMAkG\nA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBGcmFu\nY2lzY28xFDASBgNVBAoTC2V4YW1wbGUuY29tMRowGAYDVQQDExF0bHNjYS5leGFt\ncGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABNx134He4t5tliahSC1v\nI9+J6znPnmPzOc0+KHVZfO2f98bk6LRonEmQoNdfsJqyqQWN8gS3q5au8Q4kAfl7\nCwejXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAGBgRVHSUAMA8GA1UdEwEB\n/wQFMAMBAf8wKQYDVR0OBCIEIJbUbf0J+olfttJlDf92ANPUPVJ3C0+3v3lwFyKZ\n96rpMAoGCCqGSM49BAMCA0gAMEUCIQCr7nEj3H6Q6ae65hB/KKh0nSyoY18qRI0Y\nc7dnonOlrAIgCvoV/o6R/0ejG0jzgvs1WoypcYo1fzHixRhLAcKS7Gc=\n-----END CERTIFICATE-----\n"
            }
        }
    },
   "peers": {
        "peer0.org1.example.com": {
            "url": "grpc://localhost:7051",
            "grpcOptions": {
                "ssl-target-name-override": "peer0.org1.example.com"
            },
            "tlsCACerts": {
                "pem": "-----BEGIN CERTIFICATE-----\nMIICSTCCAfCgAwIBAgIRAKxPcVdTZ6ZxDFItulcEQPQwCgYIKoZIzj0EAwIwdjEL\nMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG\ncmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHzAdBgNVBAMTFnRs\nc2NhLm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwMTA3MTAyNTE1WhcNMjkwMTA0MTAy\nNTE1WjB2MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UE\nBxMNU2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEfMB0G\nA1UEAxMWdGxzY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49\nAwEHA0IABAQthdAI2w6ZIkgdYl6UW/ee4287n1bW3Q9PwQM+3kGYUurIiPR18o3c\nV4/S3sYPYUhsero+CfGo6qPMrCI35JCjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNV\nHSUECDAGBgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEINm8aqgTv80z\nndL7PAJSQaUiy0RdFEybys85K7diPJIsMAoGCCqGSM49BAMCA0cAMEQCIA4ZwddC\nxZmZZ/4sCWIOFjzFKkMtkIGB6dCppmPFXQF5AiAHpgBEZOdtcIWN0AZDZDv9uw4l\nP2MAuiYhmG13Qp9zZw==\n-----END CERTIFICATE-----\n"
            }
        },
        "peer1.org1.example.com": {
            "url": "grpc://localhost:8051",
            "grpcOptions": {
                "ssl-target-name-override": "peer1.org1.example.com"
            },
            "tlsCACerts": {
                "pem": "-----BEGIN CERTIFICATE-----\nMIICSTCCAfCgAwIBAgIRAKxPcVdTZ6ZxDFItulcEQPQwCgYIKoZIzj0EAwIwdjEL\nMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG\ncmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHzAdBgNVBAMTFnRs\nc2NhLm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwMTA3MTAyNTE1WhcNMjkwMTA0MTAy\nNTE1WjB2MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UE\nBxMNU2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEfMB0G\nA1UEAxMWdGxzY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49\nAwEHA0IABAQthdAI2w6ZIkgdYl6UW/ee4287n1bW3Q9PwQM+3kGYUurIiPR18o3c\nV4/S3sYPYUhsero+CfGo6qPMrCI35JCjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNV\nHSUECDAGBgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEINm8aqgTv80z\nndL7PAJSQaUiy0RdFEybys85K7diPJIsMAoGCCqGSM49BAMCA0cAMEQCIA4ZwddC\nxZmZZ/4sCWIOFjzFKkMtkIGB6dCppmPFXQF5AiAHpgBEZOdtcIWN0AZDZDv9uw4l\nP2MAuiYhmG13Qp9zZw==\n-----END CERTIFICATE-----\n"
            }
        },
        "peer0.org2.example.com": {
            "url": "grpc://localhost:9051",
            "grpcOptions": {
                "ssl-target-name-override": "peer0.org2.example.com"
            },
            "tlsCACerts": {
                "pem": "-----BEGIN CERTIFICATE-----\nMIICSDCCAe+gAwIBAgIQHmDJBCSBGAZvQHQzRTOGDjAKBggqhkjOPQQDAjB2MQsw\nCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy\nYW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEfMB0GA1UEAxMWdGxz\nY2Eub3JnMi5leGFtcGxlLmNvbTAeFw0xOTAxMDcxMDI1MTZaFw0yOTAxMDQxMDI1\nMTZaMHYxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH\nEw1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBvcmcyLmV4YW1wbGUuY29tMR8wHQYD\nVQQDExZ0bHNjYS5vcmcyLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0D\nAQcDQgAE64jWIVHNtMxdVPqLGO5gDCxONhvym2RnHJl2mAhgUYWpSRVMuYOvvxYj\nrP1lE4b+ekZM7Fn4t5PJkklMXcnvY6NfMF0wDgYDVR0PAQH/BAQDAgGmMA8GA1Ud\nJQQIMAYGBFUdJQAwDwYDVR0TAQH/BAUwAwEB/zApBgNVHQ4EIgQgF1uI50Vbvjbh\nERUSBs4yOyO3efPXCLPnL+bEGqFqlfkwCgYIKoZIzj0EAwIDRwAwRAIgM55ngpVW\ntSewOPwrssQNusWLvDq37I/4Vtw+3+smrZcCICzPew7tyAJ65lYCYmtNe8dGt3JA\nRLVeRYH4NwPiGXqL\n-----END CERTIFICATE-----\n"
            }
        },
        "peer1.org2.example.com": {
            "url": "grpc://localhost:10051",
            "grpcOptions": {
                "ssl-target-name-override": "peer1.org2.example.com"
            },
            "tlsCACerts": {
                "pem": "-----BEGIN CERTIFICATE-----\nMIICSDCCAe+gAwIBAgIQHmDJBCSBGAZvQHQzRTOGDjAKBggqhkjOPQQDAjB2MQsw\nCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy\nYW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEfMB0GA1UEAxMWdGxz\nY2Eub3JnMi5leGFtcGxlLmNvbTAeFw0xOTAxMDcxMDI1MTZaFw0yOTAxMDQxMDI1\nMTZaMHYxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQH\nEw1TYW4gRnJhbmNpc2NvMRkwFwYDVQQKExBvcmcyLmV4YW1wbGUuY29tMR8wHQYD\nVQQDExZ0bHNjYS5vcmcyLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0D\nAQcDQgAE64jWIVHNtMxdVPqLGO5gDCxONhvym2RnHJl2mAhgUYWpSRVMuYOvvxYj\nrP1lE4b+ekZM7Fn4t5PJkklMXcnvY6NfMF0wDgYDVR0PAQH/BAQDAgGmMA8GA1Ud\nJQQIMAYGBFUdJQAwDwYDVR0TAQH/BAUwAwEB/zApBgNVHQ4EIgQgF1uI50Vbvjbh\nERUSBs4yOyO3efPXCLPnL+bEGqFqlfkwCgYIKoZIzj0EAwIDRwAwRAIgM55ngpVW\ntSewOPwrssQNusWLvDq37I/4Vtw+3+smrZcCICzPew7tyAJ65lYCYmtNe8dGt3JA\nRLVeRYH4NwPiGXqL\n-----END CERTIFICATE-----\n"
            }
        }
    },
    "certificateAuthorities": {
        "ca.org1.example.com": {
            "url": "http://localhost:7054",
            "caName": "ca.org1.example.com"
        }
    }
}
EOF
FILEPATH=./connection.json
CARDOUTPUT=PeerAdmin@hlfv1.card

"${HL_COMPOSER_CLI}"  card create -p "${FILEPATH}" -u PeerAdmin -c "${CERT}" -k "${PRIVATE_KEY}" -r PeerAdmin -r ChannelAdmin --file $CARDOUTPUT

