
<pre>
hernad on  main [!?⇡] 
❯ nix-shell -p nomad
</pre>

<pre>
❯ DIR=/run/user/1000/tmp.OIEOZUm5RO && export NOMAD_ADDR=http://localhost:4646 && NOMAD_CLIENT_CERT=$DIR/nomad-client.crt && NOMAD_CLIENT_KEY=$DIR/nomad-client.key && NOMAD_CAFILE=$DIR/nomad.crt && export NOMAD_CLIENT_CERT NOMAD_CLIENT_KEY NOMAD_CAFILE
</pre>

<pre>
❯ nomad status
ID                  Type     Priority  Status   Submit Date
core-d53            service  90        running  2023-06-13T18:23:14+02:00
nix2-hello-service  service  50        running  2023-06-21T10:13:58+02:00
</pre>


<pre>
❯ nomad stop nix2-hello-service
==> 2023-07-13T09:24:50+02:00: Monitoring evaluation "e41dcab1"
    2023-07-13T09:24:50+02:00: Evaluation triggered by job "nix2-hello-service"
    2023-07-13T09:24:51+02:00: Evaluation status changed: "pending" -> "complete"
==> 2023-07-13T09:24:51+02:00: Evaluation "e41dcab1" finished with status "complete"
</pre>


<pre>
❯ nomad run cluster/staging/app/hello/deploy/hello.hcl
==> 2023-07-13T09:25:30+02:00: Monitoring evaluation "dd6f804e"
    2023-07-13T09:25:30+02:00: Evaluation triggered by job "nix2-hello-service"
    2023-07-13T09:25:31+02:00: Evaluation within deployment: "39f861f7"
    2023-07-13T09:25:31+02:00: Allocation "1a94e94c" created: node "f9ffc766", group "hellos"
    2023-07-13T09:25:31+02:00: Allocation "60a324d8" created: node "bc13f4eb", group "hellos"
    2023-07-13T09:25:31+02:00: Evaluation status changed: "pending" -> "complete"
==> 2023-07-13T09:25:31+02:00: Evaluation "dd6f804e" finished with status "complete" but failed to place all allocations:
    2023-07-13T09:25:31+02:00: Task Group "hellos" (failed to place 1 allocation):
      * Resources exhausted on 3 nodes
      * Dimension "network: reserved port collision http_port=8080" exhausted on 3 nodes
    2023-07-13T09:25:31+02:00: Evaluation "37440cf2" waiting for additional capacity to place remainder
==> 2023-07-13T09:25:31+02:00: Monitoring deployment "39f861f7"
  ✓ Deployment "39f861f7" successful
    
    2023-07-13T09:25:44+02:00
    ID          = 39f861f7
    Job ID      = nix2-hello-service
    Job Version = 39
    Status      = successful
    Description = Deployment completed successfully
    
    Deployed
    Task Group  Desired  Placed  Healthy  Unhealthy  Progress Deadline
    hellos      3        3       3        0          2023-07-13T09:35:43+02:00
</pre>


<pre>
❯ nomad job status nix2-hello-service 
ID            = nix2-hello-service
Name          = nix2-hello-service
Submit Date   = 2023-07-13T09:25:30+02:00
Type          = service
Priority      = 50
Datacenters   = sa1
Namespace     = default
Status        = running
Periodic      = false
Parameterized = false

Summary
Task Group  Queued  Starting  Running  Failed  Complete  Lost  Unknown
hellos      0       0         3        45      19        0     0

Latest Deployment
ID          = 39f861f7
Status      = successful
Description = Deployment completed successfully

Deployed
Task Group  Desired  Placed  Healthy  Unhealthy  Progress Deadline
hellos      3        3       3        0          2023-07-13T09:35:43+02:00

Allocations
ID        Node ID   Task Group  Version  Desired  Status   Created    Modified
7af7dd54  c00d1a83  hellos      39       run      running  3m2s ago   2m49s ago
1a94e94c  f9ffc766  hellos      39       run      running  3m3s ago   2m50s ago
60a324d8  bc13f4eb  hellos      39       run      running  3m3s ago   2m50s ago
9705d003  f9ffc766  hellos      37       stop     failed   1d17h ago  3m7s ago
63d26653  bc13f4eb  hellos      37       stop     failed   1d17h ago  3m7s ago
066683f9  c00d1a83  hellos      37       stop     failed   1d17h ago  3m2s ago
</pre>


<pre>
> nomad exec -i -t -task nix-python-serve-http 7af7dd54 /bin/bash

bash-5.2$ ping consul.service.staging.consul
PING consul.service.staging.consul (10.183.1.1) 56(84) bytes of data.
64 bytes from 10.183.1.1 (10.183.1.1): icmp_seq=1 ttl=64 time=0.055 ms
</pre>


<pre>
bash-5.2$ dig consul.service.staging.consul

; <<>> DiG 9.18.16 <<>> consul.service.staging.consul
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 55700
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;consul.service.staging.consul.	IN	A

;; ANSWER SECTION:
consul.service.staging.consul. 0 IN	A	10.183.1.1
consul.service.staging.consul. 0 IN	A	10.183.1.2
consul.service.staging.consul. 0 IN	A	10.183.1.3

;; Query time: 0 msec
;; SERVER: 127.0.0.1#53(127.0.0.1) (UDP)
;; WHEN: Thu Jul 13 07:45:18 UTC 2023
;; MSG SIZE  rcvd: 106
</pre>