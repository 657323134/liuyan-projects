package @packageDir;

/**
* <p>Title: @objectNameU</p>
* <p>Description: @objectNameL vo </p>
* @author @authorName
* @version 0.1
*/

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="@tableName")
public class @objectNameU implements Serializable {
<L>
    <LA>
        /**
        * @fieldDesc
        */
        @Column(name="@fieldNameL")
        private @fieldType @fieldNameL;
    </LA>
</L>

<L>
    <LA>
        /**
        * @fieldDesc getter,setter method
        */
        public @fieldType get@fieldNameU( ){
        return @fieldNameL;
        }

        public void set@fieldNameU( @fieldType @fieldNameL ){
        this.@fieldNameL = @fieldNameL;
        }
    </LA>
</L>
}