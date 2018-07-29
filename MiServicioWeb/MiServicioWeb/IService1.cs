﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace MiServicioWeb
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        //RequestFormat = WebMessageFormat.Json


        

        [OperationContract]
        [WebInvoke(Method = "POST",
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.Bare, UriTemplate = "AgregarAsesoria")]
        bool AgregarAsesoria(Asesoria asesoria);

        [OperationContract]
        [WebInvoke(Method = "POST",
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.Bare, UriTemplate = "AgregarInscripcion")]
        bool AgregarInscripcion(AA inscripcion);

        [OperationContract]
        [WebInvoke(Method = "POST",
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.Bare, UriTemplate = "AsesoriasProfesor")]
        string AsesoriasProfesor(Profesor p);

        [OperationContract]
        [WebInvoke(Method = "POST",
                    ResponseFormat = WebMessageFormat.Json,
                    BodyStyle = WebMessageBodyStyle.Bare, UriTemplate = "MostrarAsesorias")]
        string MH(Profesor p);

        [OperationContract]
        [WebGet( ResponseFormat = WebMessageFormat.Json)]
        double Operacion();

        [OperationContract]
        [WebGet(ResponseFormat = WebMessageFormat.Json)]
        List<Person> GetPlayers();


    }

    [DataContract]
    public class Person
    {
        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public int Age { get; set; }

        public Person()
        {
            
        }
    }

    [DataContract]
    public class Respuesta
    {
        [DataMember]
        public bool exito { get; set; }

        [DataMember]
        public DataTable html { get; set; }
        

        public Respuesta()
        {

        }
    }

    [DataContract]
    public class Profesor
    {
        [DataMember]
        public int idprofesor { get; set; }


        public Profesor()
        {

        }
    }




    [DataContract]
    public class AA
    {
        int idasesoria;

        [DataMember]
        public int Idasesoria
        {
          get { return idasesoria; }
          set { idasesoria = value; }
        }
        int matricula;

        [DataMember]
        public int Matricula
        {
          get { return matricula; }
          set { matricula = value; }
        }
        string nombre;

        [DataMember]
        public string Nombre
        {
          get { return nombre; }
          set { nombre = value; }
        }
        string tema;

        [DataMember]
        public string Tema
        {
          get { return tema; }
          set { tema = value; }
        }



    }

    [DataContract]
    public class Asesoria
    {
        int idprofesor;

        [DataMember]
        public int Idprofesor
        {
          get { return idprofesor; }
          set { idprofesor = value; }
        }
        int cupo;

        [DataMember]
        public int Cupo
        {
          get { return cupo; }
          set { cupo = value; }
        }
        string dia;

        [DataMember]
        public string Dia
        {
          get { return dia; }
          set { dia = value; }
        }

        [DataMember]
        public int Idhora { get => idhora; set => idhora = value; }

        int idhora;

        
        
    }

}