# JavaWEB
>刚入门Java WEB,从JavaSE到Java Web，只能说Come On了吧。。
#### Java Web是什么呢？
> 本人的理解就是我们平常使用浏览器看到的的网页以及隐含的内部操作（服务器）的一个整体，游览器访问，服务器处理并回复，这一系列就是Java Web
#### Java Web需要学什么？
>本人在JavaSE的学习过程中接触到了网络编程和通信编程，也就是Socket套接字的相关知识，其实Java Web中对于Socket的依赖性也很大。为啥这样说呢？
>因为Socket接口封装了TCP/IP,也就是说TCP/IP的操作基于Socket套接字，Socket实现客户端与服务端的连接，而TCP是Web的传输层协议，IP为Web网络层协议。
#### Servlet与CGI的区别
> Servlet是Java的一个接口，实现服务器对于客户端请求的处理。而CGI（Common Gateway Interface）称为通用网关接口，与Servlet具有相同的功能。由于服务器
> 只能处理服务器中特定的目录下的文件，CGI的功能是web与web之间的交互，这也是网关的作用，所以CGI可以访问操作服务器范围之外的文件，比如数据库，文件等
#### HTTP与TCP/IP协议的区别
> TCP/IP基于Socket，用于连接客户端与服务端，在这连接的过程中，包含了TCP的三次握手，四次断开。
> Http协议，即应用层协议，基于TCP/IP协议。
> Http协议相当与一辆小轿车，它用来封装页面显示信息（HTML文档），而TCP/IP协议就相当于发动机。
如下图>>>>>
[]()
#### TCP三次握手
TCP是因特网中的传输层协议，使用三次握手协议建立连接。当主动方发出SYN连接请求后，等待对方回答
SYN+ACK ，并最终对对方的 SYN 执行 ACK 确认。这种建立连接的方法可以防止产生错误的连接，TCP使用的流量控制协议是可变大小的滑动窗口协议。 

![](https://baike.baidu.com/pic/TCP/33012/0/a1ad16fa330e9cae59ee90ca?fr=lemma&ct=single)

TCP三次握手的过程如下：
1. 客户端发送SYN（SEQ=x）报文给服务器端，进入SYN_SEND状态。
2. 服务器端收到SYN报文，回应一个SYN （SEQ=y）ACK(ACK=x+1）报文，进入SYN_RECV状态。
3. 客户端收到服务器端的SYN报文，回应一个ACK(ACK=y+1）报文，进入Established状态。
三次握手完成，TCP客户端和服务器端成功地建立连接，可以开始传输数据了。

#### TCP四次终止握手
建立一个连接需要三次握手，而终止一个连接要经过四次握手，这是由TCP的半关闭（half-close）造成的。具体过程如下图所示。

![](https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=c2837728728b4710da22f59ea2a7a898/a1ec08fa513d269721cc875455fbb2fb4316d898.jpg)

(1) 某个应用进程首先调用close，称该端执行“主动关闭”（active close）。该端的TCP于是发送一个FIN分节，表示数据发送完毕。

(2) 接收到这个FIN的对端执行 “被动关闭”（passive close），这个FIN由TCP确认。

注意：FIN的接收也作为一个文件结束符（end-of-file）传递给接收端应用进程，放在已排队等候该应用进程接收的任何其他数据之后，因为，FIN的接收意味着接收端应用进程在相应连接上再无额外数据可接收。

(3) 一段时间后，接收到这个文件结束符的应用进程将调用close关闭它的套接字。这导致它的TCP也发送一个FIN。

(4) 接收这个最终FIN的原发送端TCP（即执行主动关闭的那一端）确认这个FIN。
既然每个方向都需要一个FIN和一个ACK，因此通常需要4个分节。
