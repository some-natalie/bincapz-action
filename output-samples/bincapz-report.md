## ./nc

Overall risk: ✅ 2/MEDIUM

|   RISK   |          KEY          |                        DESCRIPTION                         |
|----------|-----------------------|------------------------------------------------------------|
| meta     | format                | macho                                                      |
| meta     | program_name          | PROGRAM:nc                                                 |
| meta     | entitlements          | com.apple.private.network.intcoproc.restricted.development |
|          |                       | com.apple.security.network.client                          |
|          |                       | com.apple.security.network.server                          |
|          |                       |                                                            |
| 2/MEDIUM | net/ip/string         | converts IP address from byte to string                    |
| 2/MEDIUM | net/socket/connect    | initiate a connection on a socket                          |
| 2/MEDIUM | net/socks5            | supports SOCK5 proxies                                     |
| 1/LOW    | net/hostport/parse    | network address and service translation                    |
| 1/LOW    | net/http/request      | makes HTTP requests                                        |
| 1/LOW    | net/interface/get     | get network interfaces by name or index                    |
| 1/LOW    | net/socket/listen     | listen on a socket                                         |
| 1/LOW    | net/socket/receive    | receive a message from a socket                            |
| 1/LOW    | net/socket/send       | send a message to a socket                                 |
| 1/LOW    | process/multithreaded | uses pthreads                                              |

