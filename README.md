# init container for C++
 "This is a test of an interesting assignment - to upadate an existing C++ program using the init container. 
 The chosen program is a Fibonacci number search program. 
 As a simple application - a web server - Python is used."

```
...
  - name: builder
    image: gcc:latest
    command: ['sh', '-c', 'g++ -static /source/fibonacci.cpp -o /source/fibonacci && cp /source/fibonacci /app']
    volumeMounts:
    - name: app-volume
      mountPath: /source
...
```

![Default looks](https://github.com/43034r/Python_and_cpp_example/raw/main/1.JPG)