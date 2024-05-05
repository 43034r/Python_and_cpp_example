from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class FibonacciHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()

        # Получаем значение n из URL запроса
        n_str = self.path.split('/')[-1]
        try:
            n = int(n_str)
            # Вызываем C++ программу для расчета числа Фибоначчи
            result = subprocess.run(['./fibonacci', str(n)], capture_output=True, text=True)
            fibonacci_number = result.stdout.strip()
            self.wfile.write(f"Fibonacci({n}) = {fibonacci_number}".encode())
        except ValueError:
            self.wfile.write("Invalid input. Please provide a valid integer.".encode())

def run_server(port=8000):
    server_address = ('', port)
    httpd = HTTPServer(server_address, FibonacciHandler)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run_server()