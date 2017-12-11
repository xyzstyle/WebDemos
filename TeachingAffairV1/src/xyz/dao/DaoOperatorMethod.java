package xyz.dao;

import xyz.connection.DatabaseConnection;
import xyz.model.StudentModel;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoOperatorMethod {

    public final static int RECORD_INSERT = 1;
    public final static int RECORD_UPDATE = 2;
    public final static int RECORD_DELETE = 3;

}
