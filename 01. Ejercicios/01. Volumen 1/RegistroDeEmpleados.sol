// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistroDeEmpleados {
    address public propietario;

    constructor() {
        propietario = (msg.sender);
    }

    struct Empleado {
        uint256 idEmpleado;
        string nombre;
        uint256 salario;
    }

    mapping(uint256 => Empleado) public empleados;

    function agregarEmpleado (
        uint256 _idEmpleado,
        string memory _nombre, 
        uint256 _salario
    ) public {
        require(msg.sender == propietario, "No tiene privilegios para realizar cambios");
        require(empleados[_idEmpleado].idEmpleado == 0, "El empleado ya esta dado de alta");
        empleados[_idEmpleado] = Empleado (_idEmpleado, _nombre, _salario);
    } 

    function obtenerEmpleaado (
        uint256 _idEmpleado
    ) public view returns (uint256,string memory, uint256){
        require(empleados[_idEmpleado].idEmpleado != 0, "Este empleado no existe");
        return (empleados[_idEmpleado].idEmpleado , empleados[_idEmpleado].nombre ,empleados[_idEmpleado].salario );
    }

    function actualizarSalarioEmpleado (
        uint256 _idEmpleado, uint256 _salario 
    ) public {
         require(msg.sender == propietario, "No tiene privilegios para realizar cambios");
         empleados[_idEmpleado].salario = _salario;
    }

    function eliminarEmpleado (
        uint256 _idEmpleado
    )public{
        require(msg.sender == propietario, "No tiene privilegios para realizar cambios");
        delete empleados[_idEmpleado];
    }
        

}

