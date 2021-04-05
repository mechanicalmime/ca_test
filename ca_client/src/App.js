import './App.css';
import { Navbar, NavbarBrand, NavbarToggler, Container, Row, Col } from 'reactstrap'
import CarSearch from './CarSearch'

function App() {
  return (
    <div className="App">
      <Navbar color="dark" expand="md">
        <NavbarBrand href="#home" className="text-light">🚗 Hands-on-Test 🚙</NavbarBrand>
        <NavbarToggler aria-controls="basic-navbar-nav" />
      </Navbar>

      <Container>
        <Row>
          <Col>
            <CarSearch></CarSearch>
          </Col>
        </Row>
      </Container>
    </div>
  );
}

export default App;
