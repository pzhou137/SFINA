/*
 * Copyright (C) 2016 SFINA Team
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
package interdependent.communication.Messages;

/**
 *
 * @author root
 */
public interface SfinaMessage {
    
    public static final String EVENT_MESSAGE = "Event_Message";
    public static final String NETWORK_ADDRES_CHANGE ="Network_Address_Change_Message";
    public static final String FINISHED_STEP = "Finished_Step_Message";
    
    public int getNetworkIdentifier();
    public String getMessageType();
}
