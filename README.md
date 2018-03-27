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
> 1.客户端向服务器发出SYN包请求，处于SYN-SEND状态，等待服务器回复。
> 2.服务器收到客户端请求，回复客户端ACK包，服务器处于SYN-RECV状态。
> 3.客户端收到服务器端的回复，两者处于ESTANBLISHED状态，至此，客户端与服务端正式连接。
> 注意在此过程中没有任何数据传输
